#!/usr/bin/python3
"""
holds MissingPerson class and
creates the table missingpersoncontact
"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Table
from sqlalchemy.orm import relationship


if models.storage_t == "db":
    # A table that is created to handle the many to many relationship
    # between missingperson and contacts table
    missingpersoncontact = Table('missingpersoncontact', Base.metadata,
                                 Column('missingperson_id', String(60),
                                        ForeignKey('missingperson.id',
                                                   onupdate='CASCADE',
                                                   ondelete='CASCADE'),
                                        primary_key=True),
                                 Column('contacts_id', String(60),
                                        ForeignKey('contacts.id',
                                                   onupdate='CASCADE',
                                                   ondelete='CASCADE'),
                                        primary_key=True))



class MissingPerson(BaseModel, Base):
    """Representation of Missing person"""
    if models.storage_t == "db":
        __tablename__ = 'missingperson'
        missingperson_name = Column(String(50), nullable=False)
        missingperson_gender = Column(String(6), nullable=False)
        missingperson_description = Column(String(500), nullable=True)
        address_id = Column(String(60),
                            ForeignKey('address.id'), nullable=True)
        contacts = relationship("Contacts",
                                secondary=missingpersoncontact,
                                viewonly=False)
        pics = relationship("Picture",
                            backref="missingperson",
                            cascade="all, delete, delete-orphan")
