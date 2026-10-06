package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.techhub.model.Property;
import org.techhub.repository.PropertyRepository;

@Service
public class PropertyServiceImpl implements PropertyService {

    private PropertyRepository propertyRepo;

    public PropertyServiceImpl(PropertyRepository propertyRepo) {
        this.propertyRepo = propertyRepo;
    }

    @Override
    public int addProperty(Property property) {
        return propertyRepo.addProperty(property);
    }

    @Override
    public List<Property> getAllProperties() {
        return propertyRepo.getAllProperties();
    }

    @Override
    public Property getPropertyById(int id) {
        return propertyRepo.getPropertyById(id);
    }

    @Override
    public int updateProperty(Property property) {
        return propertyRepo.updateProperty(property);
    }

    @Override
    public int deleteProperty(int id) {
        return propertyRepo.deleteProperty(id);
    }
}