cd usermanagement
DCKR_IMG=soorejjones/alohausermgmt
docker build . -t ${DCKR_IMG}
#mv Dockerfile-celery Dockerfile
#docker build . -t ${DCKR_IMG}-celery
echo "########## Container created ##########"
docker push ${DCKR_IMG}
#docker push ${DCKR_IMG}-celery
echo "########## Container published ##########"
echo "To deploy -------------------------------------------------------"
echo "1. SSH into the machine"
echo "2. Run ./update.sh"
echo "-----------------------------------------------------------------"
echo "########## Build complete ##########"
cd ..