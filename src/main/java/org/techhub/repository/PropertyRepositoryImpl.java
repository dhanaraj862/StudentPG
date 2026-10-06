package org.techhub.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.Property;

@Repository
public class PropertyRepositoryImpl implements PropertyRepository {

    private JdbcTemplate jdbcTemplate;

    public PropertyRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int addProperty(Property property) {

        String sql = "INSERT INTO properties "
                + "(property_name, address, owner_name, contact_number) "
                + "VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                property.getPropertyName(),
                property.getAddress(),
                property.getOwnerName(),
                property.getContactNumber()
        );
    }

    @Override
    public List<Property> getAllProperties() {

        String sql = "SELECT * FROM properties";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Property property = new Property();

            property.setId(rs.getInt("id"));
            property.setPropertyName(rs.getString("property_name"));
            property.setAddress(rs.getString("address"));
            property.setOwnerName(rs.getString("owner_name"));
            property.setContactNumber(rs.getString("contact_number"));

            return property;
        });
    }

    @Override
    public Property getPropertyById(int id) {

        String sql = "SELECT * FROM properties WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {

                    Property property = new Property();

                    property.setId(rs.getInt("id"));
                    property.setPropertyName(rs.getString("property_name"));
                    property.setAddress(rs.getString("address"));
                    property.setOwnerName(rs.getString("owner_name"));
                    property.setContactNumber(rs.getString("contact_number"));

                    return property;
                },
                id
        );
    }

    @Override
    public int updateProperty(Property property) {

        String sql = "UPDATE properties SET "
                + "property_name = ?, "
                + "address = ?, "
                + "owner_name = ?, "
                + "contact_number = ? "
                + "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                property.getPropertyName(),
                property.getAddress(),
                property.getOwnerName(),
                property.getContactNumber(),
                property.getId()
        );
    }

    @Override
    public int deleteProperty(int id) {

        String sql = "DELETE FROM properties WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }
}