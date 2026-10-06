package org.techhub.service;

import java.util.List;

import org.techhub.model.Property;

public interface PropertyService 
{

    int addProperty(Property property);

    List<Property> getAllProperties();

    Property getPropertyById(int id);

    int updateProperty(Property property);

    int deleteProperty(int id);
}