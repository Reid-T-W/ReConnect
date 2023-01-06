#!/usr/bin/python3
""" Flask Application """
from models import storage
from api.v1.views import app_views
from os import environ
from flask import Flask, render_template, make_response, jsonify, request, redirect, url_for, send_from_directory, current_app
from flask_cors import CORS
from flasgger import Swagger
from flasgger.utils import swag_from
from models.missingperson import MissingPerson
from models.contactsphone import ContactsPhone
from models.contacts import Contacts
from models.picture import Picture
from models.address import Address
from math import ceil
import os
# from flask_sqlalchemy import SQLAlchemy
# import flask_whooshalchemy3 as wa
# from flask_msearch import Search
# import os

app = Flask(__name__)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True
cwd = os.getcwd()
app.config["IMAGE_UPLOADS"] = cwd + "/api/v1/static/images"
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=True
# app.config['DEBUG']=True
# app.config['WHOOSH_BASE'] = 'whoosh'
# db = SQLAlchemy()
# search = Search(db=db)
# search.init_app(app)
# search.create_index(update=True)
# MSEARCH_INDEX_NAME =  os.path.join(app.root_path,'msearch')
# MSEARCH_PRIMARY_KEY = 'id'
# MSEARCH_ENABLE = True


# wa.whoosh_index(app, MissingPerson, ContactsPhone, Contacts)

app.register_blueprint(app_views)
cors = CORS(app, resources={r"/api/v1/*": {"origins": "*"}})

def get_missingpersons():
    """
    Retrieves the list of all State objects
    """
    all_missingpersons = storage.all(MissingPerson).values()
    return all_missingpersons
    # list_missingpersons = []
    # for person in all_missingpersons:
    #   list_missingpersons.append(person.to_dict())
    # return jsonify(list_missingpersons)

def get_address(address_id):
    """ Retrieves a specific Address """
    address = storage.get(Address, address_id)
    return address
    # if not address:
    #   abort(404)
    # return jsonify(address.to_dict())

def get_address(address_id):
    """ Retrieves a specific Address """
    address = storage.get(Address, address_id)
    if not address:
        abort(404)
    return address

def get_missingperson(missingperson_id):
    """ Retrieves a specific MissingPerson """
    person = storage.get(MissingPerson, missingperson_id)
    if not person:
        abort(404)
    return person

def sort_by_face_similarity(search_image, missingpersons):
    distances = []
    test_embedding = Picture.generate_embedding(search_image)
    for person in missingpersons:
        indiv_dists = []
        for pic in person.pics:
            distance = pic.compute_distance(test_embedding)
            indiv_dists.append(distance)
        # Out of all the images for an individual the minimum
        # distance is taken for identification purpose
        distances.append(min(indiv_dists))
    # sorted_missingpersons = [missingpersons for distances, missingpersons in sorted(zip(distances, missingpersons))]
    # Sorting the missingpersons list based on their distance to the test embedding
    zipped = zip(missingpersons, distances)
    # Converting to list
    zipped = list(zipped)
    # Sorting the list using sorted and lambda
    sorted_missingpersons = sorted(zipped, key = lambda x: x[1])
    #Extracting the missingperson object list from the zipped list
    new_list = list(zip(*sorted_missingpersons))
    print("Object Only: ", new_list[0])
    return new_list[0]

@app.route('/', methods=['GET'], strict_slashes=False)
def get_home_page():
    """ Get Home Page """
    return render_template("home_page.html")


@app.route('/post', methods=['GET'], strict_slashes=False)
def get_post_page():
    return render_template("post_page.html")

@app.route('/post', methods=['POST'], strict_slashes=False)
def save_data():
    if request.method == "POST":
            request_dict = {}
            name = request.form['name']
            gender = request.form['gender']
            request_dict["name"] = name
            request_dict["gender"] = gender
            # name = request.files["name"]
            return request_dict

@app.route('/search', methods=['GET'], strict_slashes=False)
def get_search_page():
    # Get all individuals in the database
    missingpersons = get_missingpersons()
    #names = {}
    #for person in missingpersons:
    #    names[person.id] = person.missingperson_name
    #count_missingpersons = storage.count(MissingPerson)
    #if count_missingpersons <= 3:
    #    rows = 1
    #else:
    #    rows = ceil(count_missingpersons/3)
    # Pass the name and image of every individual
    return render_template("search_page.html", missingpersons=missingpersons)
    #return render_template("search_page.html")

#@app.route('/static/images/<filename>')
#def get_file(filename):
#    return send_from_directory('/static/images', filename)

@app.route('/search/<missingperson_id>', methods=['GET'], strict_slashes=False)
def get_result_page(missingperson_id):
    person = get_missingperson(missingperson_id)
    address = get_address(person.address_id)
    pics = person.pics
    for pic in pics:
        pic_url = url_for('static', filename=pic.picture)    
    return render_template("results_page.html", person=person, address=address, pic_url=pic_url)


# @app.route('/fulltext/<query>', methods=['GET'], strict_slashes=False)
# def full_text_search(query):
#    person = MissingPerson.query.msearch(keyword,fields=['missingperson_name','missingperson_gender','missingperson_description'])
#    print(person)
#    return

@app.route('/facesearch', methods=['POST'], strict_slashes=False)
def get_similar_individual():
    # Get all individuals in the database sorted by face similarity
    # Retriving the image to be searched
    search_image = request.files["image1"]
    temp_filename = 'temporary/' + search_image.filename
    pic_path = os.path.join(current_app.config["IMAGE_UPLOADS"], temp_filename)
    search_image.save(pic_path)
    # Getting all missing persons saved in the database
    missingpersons = get_missingpersons()
    # face_sorted_missingpersons = sort_by_face_similarity(search_image, missingpersons)
    sorted_missingpersons = sort_by_face_similarity(pic_path, missingpersons)
    return render_template("search_page.html", missingpersons=sorted_missingpersons)

@app.route('/about', methods=['GET'], strict_slashes=False)
def get_about_page():
    return render_template("about_page.html")


@app.teardown_appcontext
def close_db(error):
    """ Close Storage """
    storage.close()


@app.errorhandler(404)
def not_found(error):
    """ 404 Error
    ---
    responses:
      404:
        description: a resource was not found
    """
    return make_response(jsonify({'error': "Not found"}), 404)

app.config['SWAGGER'] = {
    'title': 'ReConnect Restful API',
    'uiversion': 3
}

Swagger(app)


if __name__ == "__main__":
    """ Main Function """
    app.config['TEMPLATES_AUTO_RELOAD']=True
    host = environ.get('HBNB_API_HOST')
    port = environ.get('HBNB_API_PORT')
    if not host:
        host = '0.0.0.0'
    if not port:
        port = '5000'
    app.run(host=host, port=port, threaded=True)
