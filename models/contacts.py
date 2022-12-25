#!/usr/bin/python3
"""holds Contacts class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Columm, String, ForeignKey
from sqlalchemy.orm import relationship


class Contacts(BaseModel, Base):
    """Representation of Contacts"""
    if models.storage_t == "db":
        __tablename__ = 'contacts'
        contacts_name = Column(String(50), nullable=False)
        phones = relationship("ContactsPhone",
                              backref="contacts",
                              cascade="all, delete, delete-orphan")
