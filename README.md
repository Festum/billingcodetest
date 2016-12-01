# Billingtest

## Running

Set up a Docker Machine and then run:

```sh
$ docker-compose up
```

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## Instruction

- create a mysql database with utf8_general_ci encoding
- import sample data
- write a php program which reads the sample data in the database and writes the customer and related orders json to the screen in a structure that would be benefitial to another system/application.
- assume the following:
  - the following JSON fields come from the sample data in the database: customer_id, description, rate
  - the following JSON fields have constant values as set in the sample JSON: item_id, name, unit, tax_id, notes, quantity
  - "item_order" field in JSON is an incremented number per json
  - other JSON fields can be blank or set as the sample JSON indicates.
  - the device_serial_number field in the lines_to_invoice table is used as a key but is not required in the JSON.
- send us the completed php code so we can run it in an XAMPP/MAMP environment and connect it to our sample data using a mysql table.

**sample_output.json**:
```
{
    "customer_id": "460000000026049",
    "date": "2013-08-05",
    "line_items": [
        {
            "item_id": "460000000027017",
            "project_id": "",
            "expense_id": "",
            "name": "Print Services",
            "description": "500GB, USB 2.0 interface 1400 rpm, protective hard case.",
            "item_order": 1,
            "rate": 120,
            "unit": "Nos",
            "quantity": 1,
            "discount": 0,
            "tax_id": "460000000027005"
        },
        {
            "item_id": "460000000027017",
            "project_id": "",
            "expense_id": "",
            "name": "Print Services",
            "description": "10 GB Space, 300 GB Transfer 100 Email Accounts 10 MySQL Databases",
            "item_order": 2,
            "rate": 33,
            "unit": "Nos",
            "quantity": 1,
            "discount": 0,
            "tax_id": "460000000027005"
        }
    ],
    "notes": "Thanks for your business."
}
```