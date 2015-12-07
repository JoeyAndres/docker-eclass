IMAGE=eclass-selenium  # Set this as the name of the docker image.
CONTAINER=${IMAGE}  # Doesn't have to be this way. Set this to whatever you want to name the container.
ECLASS_DIR=/home/jandres/CompScie/eclass-unified-docker

# Change the port to the desired port in case there are conflicts.
MEMCACHED_PORT=5432
PGSQL_PORT=11211
APACHE_PORT=80

build:
	docker build -t ${IMAGE} .

run:
	bash remove-container.sh ${CONTAINER} ${IMAGE} && \
	docker run \
	-p ${MEMCACHED_PORT}:5432 \
	-p ${PGSQL_PORT}:11211 \
	-p ${APACHE_PORT}:80 \
	-v ${ECLASS_DIR}:/eclass-unified \
	--name ${CONTAINER} \
	--net=host \
	-d ${IMAGE}
