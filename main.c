#include <stdio.h>
#include <unistd.h>
double lyapunov(double r);
void lorenz_step(double *x, double *y, double *z,double sigma, double rho, double beta, double dt);
int main(){
  double x = 0.1, y = 0.0, z = 0.0;
  double sigma = 10.0, rho = 28.0, beta = 8.0 / 3.0, dt = 0.01;
  FILE *csv=fopen("chaosdiff.csv","w");
  fprintf(csv,"x,y,z\n");
  for(int i=0;i<10000;i++){
    lorenz_step(&x,&y,&z,sigma,rho,beta,dt);
    printf("%.2f\t%.2f\t%.2f\n",x,y,z);
    fprintf(csv,"%f,%f,%f\n",x,y,z);
  }
  return 0;
  }

  //TODO: implement RK4 model