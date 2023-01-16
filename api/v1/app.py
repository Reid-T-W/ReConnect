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


# Creating the flask app
app = Flask(__name__)
# Helps json data print properly
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True
# Getting the current directory so that images storage
# path "app.config["IMAGE_UPLOADS"]" can be dynamically setup
# this helps in making the code portable
cwd = os.getcwd()
app.config["IMAGE_UPLOADS"] = cwd + "/api/v1/static/images"
app.register_blueprint(app_views)
# Setting up CORS (Cross Origin Requests) rules 
cors = CORS(app, resources={r"/api/v1/*": {"origins": "*"}})

def get_missingpersons():
    """
    Retrieves the list of all MissingPersons objects
    """
    all_missingpersons = storage.all(MissingPerson).values()
    return all_missingpersons

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
    """Sorts all missingpersons based on their similarity to the search_image"""
    distances = []
    # Generating embedding for the test image
    # so that it could be compared with the embeddings
    # of individual stored in the database.
    test_embedding = Picture.generate_embedding(search_image)
    for person in missingpersons:
        indiv_dists = []
        for pic in person.pics:
            # Computing the distance between the test_embedding
            # and the embedding strored in pic.
            distance = pic.compute_distance(test_embedding)
            indiv_dists.append(distance)
        # Out of all the images for an individual the minimum
        # distance is taken for identification purpose
        distances.append(min(indiv_dists))
    # Sorting the missingpersons list based on their distance to the test embedding
    zipped = zip(missingpersons, distances)
    # Converting to list
    zipped = list(zipped)
    # Sorting the list using sorted and lambda
    sorted_missingpersons = sorted(zipped, key = lambda x: x[1])
    #Extracting the sorted missingperson object list from the zipped list
    new_list = list(zip(*sorted_missingpersons))
    return new_list[0]

@app.route('/', methods=['GET'], strict_slashes=False)
def get_home_page():
    """ Get Home Page """
    return render_template("home_page.html")

@app.route('/post', methods=['GET'], strict_slashes=False)
def get_post_page():
    """ Get Post page """
    return render_template("post_page.html")


@app.route('/search', methods=['GET'], strict_slashes=False)
def get_search_page():
    """ Get search page """
    # Get all individuals in the database
    missingpersons = get_missingpersons()
    # Pass all individuals to the search_page so that it could
    # be rendered
    return render_template("search_page.html", missingpersons=missingpersons)


@app.route('/search/<missingperson_id>', methods=['GET'], strict_slashes=False)
def get_result_page(missingperson_id):
    """ Get results page which displays an individuals details """
    # Getting person object that has the missingperson_id
    person = get_missingperson(missingperson_id)
    # Getting the address of person
    address = get_address(person.address_id)
    # Getting all pics of person
    pics = person.pics
    # Getting a url for a single pic that will be displayed as the main picture
    # when the results page is rendered, a for loop is actually not necessary here
    # we could have chose the first pic via indexing, the reason why I said first 
    # pic is because it is a must for a user to enter a single pic; other pics are
    # optional, therefore we might run into errors if we index anything other than 
    # the first index.
    for pic in pics:
        pic_url = url_for('static', filename=pic.picture)    
    return render_template("results_page.html", person=person, address=address, pic_url=pic_url)


@app.route('/facesearch', methods=['POST'], strict_slashes=False)
def get_similar_individual():
    """ Get all individuals in the database sorted by face similarity """
    # Retriving the image to be searched
    search_image = request.files["image1"]
    # Saving the search image in a temporary directory
    # This is done so that we can easily pass the image
    # to the sort_by_face_similarity function.
    temp_filename = 'temporary/' + search_image.filename
    pic_path = os.path.join(current_app.config["IMAGE_UPLOADS"], temp_filename)
    search_image.save(pic_path)
    # Getting all missing persons saved in the database
    missingpersons = get_missingpersons()
    # Getting list of missingpersons sorted by face similarity to the
    # search image
    sorted_missingpersons = sort_by_face_similarity(pic_path, missingpersons)
    return render_template("search_page.html", missingpersons=sorted_missingpersons)


@app.route('/about', methods=['GET'], strict_slashes=False)
def get_about_page():
    """ Get about page """
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
