#!/usr/bin/python3
""" Starts a flask web application """
from flask import Flask, url_for, render_template, request, redirect
import os
app = Flask(__name__)
app.config["IMAGE_UPLOADS"] = "/home/rediet/alx/ReConnect/delete/uploadImage/images"

@app.route('/upload_image', methods=["GET", "POST"])
def upload_image():
    if request.method == "POST":

        if request.files:

            image = request.files["image"]
            image.save(os.path.join(app.config["IMAGE_UPLOADS"], image.filename))
            print("Image Saved")
            return redirect(request.url)
    return render_template("upload_image.html")

if __name__ == '__main__':
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
