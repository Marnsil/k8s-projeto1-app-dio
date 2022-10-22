#!/bin/bash

echo "===== Criando as imagens ====="

docker build -t maransil/projeto-backend:1.2 backend/.
docker build -t maransil/projeto-database:1.2 database/.

echo "===== Realiznado o push das imagens ====="

docker push maransil/projeto-backend:1.2
docker push maransil/projeto-database:1.2

echo "===== Criando serviços no cluster kubernetes ====="

kubectl apply -f ./services.yml

echo "===== Criando os deployments ====="

kubectl apply -f ./deployment.yml
