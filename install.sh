#!/bin/bash -e

sudo apt-get clean
sudo mv /var/lib/apt/lists /tmp
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get clean
sudo apt-get update

GRADLE_VERSION=3.0
MAVEN_VERSION=3.3.9
ANT_VERSION=1.9.7

echo "================ Installing gradle-${GRADLE_VERSION} ================="
sudo wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip
unzip -qq gradle-${GRADLE_VERSION}-all.zip -d /usr/local && rm -f gradle-${GRADLE_VERSION}-all.zip
ln -fs /usr/local/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin
echo "export PATH=$PATH:/usr/local/gradle-${GRADLE_VERSION}/bin" >> $HOME/.bashrc

MAVEN_MAJOR_VERSION=$(echo ${MAVEN_VERSION} | cut -f1 -d.)
echo "================ Installing apache-maven-${MAVEN_VERSION} ================="
sudo wget http://mirrors.ibiblio.org/apache/maven/maven-${MAVEN_MAJOR_VERSION}/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
sudo tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/local && rm -f apache-maven-${MAVEN_VERSION}-bin.tar.gz
ln -fs /usr/local/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/bin
echo "export PATH=$PATH:/usr/local/apache-maven-${MAVEN_VERSION}/bin" >> $HOME/.bashrc

echo "================ Installing apache-ant-${ANT_VERSION} ================="
wget http://mirror.cogentco.com/pub/apache//ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz
tar xzf apache-ant-${ANT_VERSION}-bin.tar.gz -C /usr/local && rm -f apache-ant-${ANT_VERSION}-bin.tar.gz
ln -fs /usr/local/apache-ant-${ANT_VERSION}/bin/ant /usr/bin
echo "export ANT_HOME=/usr/local/apache-ant-${ANT_VERSION}" >> $HOME/.bashrc
echo "export PATH=$PATH:/usr/local/apache-ant-${ANT_VERSION}/bin" >> $HOME/.bashrc

for file in /u14jav/version/*;
do
  $file
done
