docker build -t mttlong/multi-client:latest -t mttlong/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mttlong/multi-server:latest -t mttlong/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mttlong/multi-worker:latest -t mttlong/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mttlong/multi-client:latest
docker push mttlong/multi-server:latest
docker push mttlong/multi-worker:latest
docker push mttlong/multi-client:$SHA
docker push mttlong/multi-server:$SHA
docker push mttlong/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mttlong/multi-server:$SHA
kubectl set image deployments/client-deployment client=mttlong/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=mttlong/multi-worker:$SHA