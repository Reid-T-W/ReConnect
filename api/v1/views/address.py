#!/usr/bin/python3
""" objects that handle all default RestFul API actions for States """
from models.address import Address
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/address', methods=['GET'], strict_slashes=False)
@swag_from('documentation/address/get_address.yml', methods=['GET'])
def get_addresses():
    """
    Retrieves the list of all Address objects
    """
    # Fetching all Address from the database
    all_addresses = storage.all(Address).values()
    list_addresses = []
    for address in all_addresses:
        # Converting address into a list and adding it to a list
        list_addresses.append(address.to_dict())
    return jsonify(list_addresses)


@app_views.route('/address/<address_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/address/get_id_address.yml', methods=['GET'])
def get_address(address_id):
    """ Retrieves a specific Address """
    address = storage.get(Address, address_id)
    # If address id does not exist in the database abort with a 404 
    if not address:
        abort(404)
    return jsonify(address.to_dict())


@app_views.route('/address/<address_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/address/delete_address.yml', methods=['DELETE'])
def delete_address(address_id):
    """
    Deletes an Address Object
    """

    address = storage.get(Address, address_id)
    
    # If address id does not exist in the database abort with a 404 
    if not address:
        abort(404)

    # Deleting the address object
    storage.delete(address)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/address', methods=['POST'], strict_slashes=False)
@swag_from('documentation/address/post_address.yml', methods=['POST'])
def post_address():
    """
    Creates an Address
    """
    # Ensuring that the request is a proper json
    if not request.get_json():
        abort(400, description="Not a JSON")
    # Ensuring that required fields, subcity and woreda, are present in 
    # requests json
    if 'subcity' not in request.get_json():
        abort(400, description="Subcity Missing")

    if 'woreda' not in request.get_json():
        abort(400, description="Woreda Missing")

    data = request.get_json()
    # Creating an address object
    instance = Address(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/address/<address_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/address/put_address.yml', methods=['PUT'])
def put_address(address_id):
    """
    Updates a Address
    """
    address = storage.get(Address, address_id)
    
    # If address id does not exist in the database abort with a 404
    if not address:
        abort(404)

    # Ensuring that the request is a proper json
    if not request.get_json():
        abort(400, description="Not a JSON")
    
    # Attributes id, created_at, and updated_at cannot be updated
    ignore = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            # Setting a new value to the address object's attribute
            setattr(address, key, value)
    storage.save()
    return make_response(jsonify(address.to_dict()), 200)
