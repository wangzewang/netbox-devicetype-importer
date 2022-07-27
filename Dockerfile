FROM docker.io/netboxcommunity/netbox:latest

#add your other plugin in plugin_requirements.txt and comment the two lines below
#COPY ./plugin_requirements.txt /
#RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt

COPY ./dist/netbox_devicetype_importer-0.1.0-py3-none-any.whl /
RUN /opt/netbox/venv/bin/pip install /netbox_devicetype_importer-0.1.0-py3-none-any.whl

# These lines are only required if your plugin has its own static files.
# config your plugin in your configuration.py
COPY configuration.py /etc/netbox/config/configuration.py
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

