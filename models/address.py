#!/usr/bin/python3
"""holds Address class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class Address(BaseModel, Base):
    """Representation of ContactsPhone"""
    if models.storage_t == "db":
        __tablename__ = 'address'
        city = Column(String(30), nullable=False)
        subcity = Column(String(30), nullable=False)
        woreda = Column(String(30), nullable=False)
        missingperson = relationship("MissingPerson",
                                     backref="address",
                                     cascade="all, delete, delete-orphan")
