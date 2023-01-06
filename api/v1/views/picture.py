#!/usr/bin/python3
""" objects that handle all default RestFul API actions for States """
from models.picture import Picture
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/picture', methods=['GET'], strict_slashes=False)
@swag_from('documentation/picture/get_picture.yml', methods=['GET'])
def get_pictures():
    """
    Retrieves the list of all State objects
    """
    all_pictures = storage.all(Picture).values()
    list_pictures = []
    for picture in all_pictures:
        list_pictures.append(picture.to_dict())
    return jsonify(list_pictures)


@app_views.route('/picture/<picture_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/picture/get_id_picture.yml', methods=['GET'])
def get_picture(picture_id):
    """ Retrieves a specific MissingPerson """
    picture = storage.get(Picture, picture_id)
    if not picture:
        abort(404)

    return jsonify(picture.to_dict())


@app_views.route('/picture/<picture_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/picture/delete_picture.yml', methods=['DELETE'])
def delete_picture(picture_id):
    """
    Deletes a Picture Object
    """

    picture = storage.get(Picture, picture_id)

    if not picture:
        abort(404)

    storage.delete(picture)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/picture', methods=['POST'], strict_slashes=False)
@swag_from('documentation/picture/post_picture.yml', methods=['POST'])
def post_picture():
    """
    Creates a Picture
    """
    if not request.get_json():
        abort(400, description="Not a JSON")

    if 'picture' not in request.get_json():
        abort(400, description="Picture Missing")

    data = request.get_json()
    instance = Picture(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/picture/<picture_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/picture/put_picture.yml', methods=['PUT'])
def put_picture(picture_id):
    """
    Updates a Picture
    """
    picture = storage.get(Picture, picture_id)

    if not picture:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(picture, key, value)
    storage.save()
    return make_response(jsonify(picture.to_dict()), 200)
