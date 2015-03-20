WSO2 Identity Server 5.0.0 as a Docker container. For development use only.

## Quickstart
You need to provide a repository folder for this Docker at runtime.
So, create a folder on Docker host.
for example :
```
mkdir /my-repository
```
If you leave it empty at runtime it will fill with respository folder of downloaded wso2is-#.#.#.zip file for first time.
If you have a pre-configured WSO2IS you can copy repository folder of it into new created /my-repository foldr.

Then, run it with this command:
```
docker run -v /my-repository:/repository -d mcreations/openwrt-wso2is
```
You can use an internet browser for checking the run docker as follows:
```
https://docker-vnet-ip:9443/
https://docker-vnet-ip:9763/
```
the `docker-vnet-ip` ip address comes from ip address of docker0 interface. use ifconfig to obtain it.

## Distribution Folder
To avoid downloading the artifact from wso2.org multiple times, you can download it manually into dist folder, you can use dist/download-wso2is.sh for download the artifact .
```
cd docker-opewrt-wso2is
sh download-wso2is.sh
```
You can modify artifact version in download-wso2is.sh file, the default version is 5.0.0.