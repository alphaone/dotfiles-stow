# kube drest

# this only has to run once:
#aws eks --profile appnest-prod --region eu-west0 update-kubeconfig --name nest_eks_prod_JxEEU08Y --alias drest-prod
#aws eks --profile drest-unity-dev --region eu-west-1 update-kubeconfig --name game-server-cluster --alias drest-unity-dev
#aws eks --profile drest-unity-prod --region eu-west-1 update-kubeconfig --name game-server-cluster --alias drest-unity-prod

# use kubectx to switch kube contexts

# print most frequently used commands
function kube_exec() {
  kubectl get pods -n nest-api -l app=nest-api --sort-by=.metadata.creationTimestamp
  POD_NAME=$(kubectl get pods -n nest-api -l app=nest-api --sort-by=.metadata.creationTimestamp | tail -1 | awk '{ print $1}')
  echo "Connecting to Pod: $POD_NAME"
  kubectl exec $POD_NAME -it -n nest-api -c nest-api -- $@
}
