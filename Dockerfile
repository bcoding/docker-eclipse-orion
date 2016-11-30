FROM maven:3.3.9-jdk-8

RUN mkdir /src

WORKDIR /src

RUN git clone http://git.eclipse.org/gitroot/orion/org.eclipse.orion.client.git
RUN git clone http://git.eclipse.org/gitroot/orion/org.eclipse.orion.server.git

RUN cd org.eclipse.orion.server && mvn clean install -P platform-kepler,local-build -Dorion.client.build.skip -DskipTests

WORKDIR /src/org.eclipse.orion.server/releng/org.eclipse.orion.server.repository/target/products/org.eclipse.orion/linux/gtk/x86_64/eclipse/

CMD ./orion
