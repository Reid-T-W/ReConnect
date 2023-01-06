#!/usr/bin/python3
"""holds Picture class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Integer
from sqlalchemy.types import LargeBinary
from sqlalchemy.orm import relationship
from keras_facenet import FaceNet
from sqlalchemy.dialects.mysql import LONGTEXT
import io
import numpy


class Picture(BaseModel, Base):
    """Representation of Picture"""
    if models.storage_t == "db":
        __tablename__ = 'picture'
        picture = Column(String(500), nullable=False)
        embedding = Column(LargeBinary, nullable=True)
        missingperson_id = Column(String(60),
                                  ForeignKey('missingperson.id'),
                                  nullable=False)

        @classmethod 
        def generate_embedding(cls, image):
            """Generate embedding for the saved picture"""
            embedder = FaceNet()
            detections = embedder.extract(image, threshold=0.95)
            embedding = detections[0].get('embedding')
            return embedding

        def add_embedding(this, embedding):
            """Adds the embedding the current object"""
            print(embedding.shape)
            binary_embedding = this.adapt_array(embedding)
            this.embedding = binary_embedding

        def compute_distance(this, test_embedding):
            """Computes the distance between two embeddings"""
            embedder = FaceNet()
            embedding = this.convert_array(this.embedding)
            distance = embedder.compute_distance(embedding, test_embedding)
            return distance

        def adapt_array(this, array):
            """
            Using the numpy.save function to save a binary version of the array, and BytesIO to catch the stream of data and convert it into a BLOB.
            """
            out = io.BytesIO()
            numpy.save(out, array)
            out.seek(0)

            return out.read()

        def convert_array(this, blob):
            """
            Using BytesIO to convert the binary version of the array back into a numpy array
            """
            out = io.BytesIO(blob)
            out.seek(0)

            return numpy.load(out)

            
