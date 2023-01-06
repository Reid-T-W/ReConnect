#!/usr/bin/python3
""" objects that handle all default RestFul API actions for States """
from models.missingperson import MissingPerson
from models.contactsphone import ContactsPhone
from models.contacts import Contacts
from models.picture import Picture
from models.address import Address
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request, current_app, url_for
from flasgger.utils import swag_from
import os
import json


@app_views.route('/missingperson', methods=['GET'], strict_slashes=False)
@swag_from('documentation/missingperson/get_missingperson.yml', methods=['GET'])
def get_missingpersons():
    """
    Retrieves the list of all State objects
    """
    all_missingpersons = storage.all(MissingPerson).values()
    list_missingpersons = []
    for person in all_missingpersons:
        list_missingpersons.append(person.to_dict())
    return jsonify(list_missingpersons)


@app_views.route('/missingperson/<missingperson_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/missingperson/get_id_missingperson.yml', methods=['GET'])
def get_missingperson(missingperson_id):
    """ Retrieves a specific MissingPerson """
    person = storage.get(MissingPerson, missingperson_id)
    if not person:
        abort(404)

    return jsonify(person.to_dict())


@app_views.route('/missingperson/<missingperson_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/missingperson/delete_missingperson.yml', methods=['DELETE'])
def delete_missingperson(missingperson_id):
    """
    Deletes a MissingPerson Object
    """

    person = storage.get(MissingPerson, missingperson_id)

    if not person:
        abort(404)

    storage.delete(person)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/missingperson', methods=['POST'], strict_slashes=False)
@swag_from('documentation/missingperson/post_missingperson.yml', methods=['POST'])
def post_missingperson():
    """
    Creates a MissingPerson
    """
    if request.files:
      missingperson_dict = {}
      address_dict = {}
      picture_dict = {}
      contacts1_dict = {}
      contacts2_dict = {}
      contacts1phones_dict = {}
      contacts2phones_dict = {}

      for key in request.form.keys():
        if key == "name":
          missingperson_dict["missingperson_name"] = request.form[key]
        elif key == "gender":
          missingperson_dict["missingperson_gender"] = request.form[key]
        elif key == "description":
          missingperson_dict["missingperson_description"] = request.form[key]
        elif key == "city":
            address_dict["city"] = request.form[key]
        elif key == "subcity":
            address_dict["subcity"] = request.form[key]
        elif key == "woreda":
            address_dict["woreda"] = request.form[key]
        elif key == "contact1name":
          contacts1_dict["contacts_name"] = request.form[key]
        elif key == "contact2name":
          contacts2_dict["contacts_name"] = request.form[key]
        elif key == "contact1phone":
          contacts1phones_dict["contactsphone_name"] = request.form[key]
        elif key == "contact2phone":
          contacts2phones_dict["contactsphone_name"] = request.form[key]
    
    # Creating the instances
    # Creting contacts instance
    contacts1_instance = Contacts(**contacts1_dict)
    contacts1_instance.save()
    contacts2_instance = Contacts(**contacts2_dict)
    contacts2_instance.save()

    # Creating contactsphone instance
    # Adding contact id to the contactsphone dictionary
    contacts1phones_dict["contacts_id"] = contacts1_instance.id
    contacts2phones_dict["contacts_id"] = contacts2_instance.id

    contacts1phone_instance = ContactsPhone(**contacts1phones_dict)
    contacts1phone_instance.save()
    contacts2phone_instance = ContactsPhone(**contacts2phones_dict)
    contacts2phone_instance.save()
    # Creating address instance
    address_instance = Address(**address_dict)
    address_instance.save()

    # Creating missing person instance
    # Adding address id to missingperson dictionary
    missingperson_dict["address_id"] = address_instance.id
    missingperson_instance = MissingPerson(**missingperson_dict)
    missingperson_instance.contacts.append(contacts1_instance)
    missingperson_instance.contacts.append(contacts2_instance)
    missingperson_instance.save()
    
    # Saving the image of the missing person
    image = request.files["image1"]
    pic_path = os.path.join(current_app.config["IMAGE_UPLOADS"], image.filename)
    # pic_path = url_for('static', filename=os.path.join('images/', image.filename))
    image.save(pic_path)

    # Creating picture instance
    picture_dict["missingperson_id"] = missingperson_instance.id
    # picture_dict["picture"] = pic_path
    picture_dict["picture"] = os.path.join('images/', image.filename)
    picture_instance = Picture(**picture_dict)
    # pic_url = url_for('static', filename=picture_instance.picture)
    embedding = picture_instance.generate_embedding(pic_path)
    picture_instance.add_embedding(embedding)
    picture_instance.save()
    #return make_response(jsonify(missingperson_instance.to_dict()), 201)
    return "Saved Successfully"


@app_views.route('/missingperson/<missingperson_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/missingperson/put_missingperson.yml', methods=['PUT'])
def put_missingperson(missingperson_id):
    """
    Updates a MissingPerson
    """
    person = storage.get(MissingPerson, missingperson_id)

    if not person:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(person, key, value)
    storage.save()
    return make_response(jsonify(person.to_dict()), 200)
