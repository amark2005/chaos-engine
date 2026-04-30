#include <stdio.h>
#include <unistd.h>
double lyapunov(double r);
int main(){
  FILE *csv=fopen("chaosdiff.csv","w");
  printf("r\tlambda\n");
  fprintf(csv,"r,lambda\n");
  for(double r=2.5;r<=4.0;r+=0.01){
    double lambda=lyapunov(r);
    printf("%.2f\t%.2f\n",r,lambda);
    fprintf(csv,"%.2f,%.2f\n",r,lambda);
  }
  return 0;
  }