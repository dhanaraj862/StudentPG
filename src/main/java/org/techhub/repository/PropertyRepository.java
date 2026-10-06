package org.techhub.repository;

import java.util.List;

import org.techhub.model.Property;

public interface PropertyRepository 
{

    int addProperty(Property property);

    List<Property> getAllProperties();

    Property getPropertyById(int id);

    int updateProperty(Property property);

    int deleteProperty(int id);
}