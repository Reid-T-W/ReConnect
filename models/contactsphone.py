#!/usr/bin/python3
"""holds ContactsPhone class"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Columm, String, ForeignKey
from sqlalchemy.orm import relationship


class ContactsPhone(BaseModel, Base):
    """Representation of ContactsPhone"""
    if models.storage_t == "db":
        __tablename__ = 'contactsphone'
        contactsphone_name = Column(String(30), nullable=False)
        contacts_id = Column(String(60),
                             ForeignKey('contacts.id'),
                             nullable=False),
