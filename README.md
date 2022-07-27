# Netbox DeviceType Import Plugin
[NetBox](https://github.com/netbox-community/netbox) plugin for easy import DeviceType from [NetBox Device Type Library](https://github.com/netbox-community/devicetype-library)

## Description
The plugin uses [GitHub GraphQL API](https://docs.github.com/en/graphql) to load DeviceType from [NetBox Device Type Library](https://github.com/netbox-community/devicetype-library). The plugin loads only file tree representation from github repo and shows it as a table with vendor and model columns. DeviceType definitions files are loaded when you try to import selected models.
To use GraphQL API you need to set GitHub personal access token in plugin settings.  You don't need to grant any permissions to the token.    
How to create the token, see ["Creating a personal access token."](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

## Compatibility

This plugin in compatible with [NetBox](https://netbox.readthedocs.org/) 3.0 and later

## Installation

Pip install from source:
```
pip install -e git+https://github.com/wangzewang/netbox-devicetype-importer.git@797542468b88a140ff49203cc622b555deb90df9#egg=netbox_devicetype_importer
```
If using netbox docker:
1. clone this repo 
2. execute `make pbuild` get the wheel package
3. Add the wheel pkg to your netbox-docker, following this [instruction](https://github.com/netbox-community/netbox-docker/wiki/Using-Netbox-Plugins), Dockerfile may like this:

```
FROM docker.io/netboxcommunity/netbox:latest

COPY ./plugin_requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt

COPY ./netbox_devicetype_importer-0.1.0-py3-none-any.whl /
RUN /opt/netbox/venv/bin/pip install /netbox_devicetype_importer-0.1.0-py3-none-any.whl


# These lines are only required if your plugin has its own static files.
COPY configuration/configuration.py /etc/netbox/config/configuration.py
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

```
Enable the plugin in [NetBox Configuration](https://netbox.readthedocs.io/en/stable/configuration/)
```
PLUGINS = ['netbox_devicetype_importer']
```

## Configuration
Put your GitHub personal access token to [NetBox plugins config](https://netbox.readthedocs.io/en/stable/configuration/optional-settings/#plugins_config)  
```
PLUGINS_CONFIG = {
    'netbox_devicetype_importer': {
        'github_token': '<YOUR-GITHUB-TOKEN>'
    }
}
```
## Screenshots

![](docs/img/import.gif) 

## Future 
* Import device images from GitHub repo
* Add a GitHub REST API client that allows this plugin to be used without the GitHub token
