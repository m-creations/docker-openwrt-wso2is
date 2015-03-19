FROM mcreations/openwrt-java:7

MAINTAINER Kambiz Darabi <darabi@m-creations.net>
MAINTAINER Reza Rahimi <rahimi@m-creations.net>



ENV WSO2IS_VERSION 5.0.0
ENV WSO2IS_HOME /opt/wso2is-${WSO2IS_VERSION}

# Download WSO2IS and installing it
RUN mkdir -p ${WSO2IS_HOME}  && \
  opkg update && \
  opkg install unzip && \
  wget --progress=dot:giga  --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" http://product-dist.wso2.com/products/identity-server/${WSO2IS_VERSION}/wso2is-${WSO2IS_VERSION}.zip && \
  unzip wso2is-${WSO2IS_VERSION}.zip -d /tmp && \
  rm wso2is-${WSO2IS_VERSION}.zip && \
  mv /tmp/wso2is-* /opt/ && \
  sed  -i 's/$JAVA_HOME\/bin\/java/$JAVA_HOME\/bin\/bundled\/java/g' ${WSO2IS_HOME}/bin/wso2server.sh && \
  echo "export PATH=$PATH:$JAVA_HOME/bin/bundled:${WSO2IS_HOME}/bin" >> /etc/profile && \
  echo "export CARBON_HOME=${WSO2IS_HOME}" >> /etc/profile

# Expose ports
EXPOSE 9443 9763

CMD ${WSO2IS_HOME}/bin/wso2server.sh