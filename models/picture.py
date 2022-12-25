#!/usr/bin/python3
"""holds Picture class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Columm, String, ForeignKey
from sqlalchemy.orm import relationship


class Picture(BaseModel, Base):
    """Representation of Picture"""
    if models.storage_t == "db":
        __tablename__ = 'picture'
        picture = Column(String(500), nullable=True)
        embedding = Column(int, nullable=True)
        missingperson_id = Column(String(60),
                                  ForeignKey('missingperson.id'),
                                  nullable=False),
