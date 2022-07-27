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
To install this plug in in Docker Container, please follow the below steps: (example based on MacOS)
1. Create a directory on your HDD for the netbox dockers image and run command ```git clone https://github.com/wangzewang/netbox-devicetype-importer``` to clone this repo.
2. Change directory to the repo directory
3. Run command `make pbuild`. This command will create a file “netbox_devicetype_importer-0.1.0-py3-none-any.whl” in the `dist` directory.
4. If you have more netbox plug-in to be installed, just add more pip packages in the `plugin_requirements.txt` also edit configuration.py in the directory to include more plugin items for “PLUGINs” and “PLUGIN_CONFIG”.

![pic](https://user-images.githubusercontent.com/16834522/181286146-a0e73534-492b-461b-af56-f6aef2e990cb.png)

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
