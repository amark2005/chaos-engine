#include <stdio.h>
#include <unistd.h>
int main(){
  FILE *csv=fopen("chaosdiff.csv","w");
  double r=3.99;
  double lewis=0.5;
  double stroll=0.8888;

  printf("Iter\tlewis\tstroll\t |diff|\n");
  fprintf(csv,"Iter,lewis,stroll,diff\n");
  for(int i=0;i<40;i++){
    lewis=r*lewis*(1-lewis);
    stroll=r*stroll*(1-stroll);
    double diff=lewis-stroll;
    if(diff<0)diff=-diff;
    printf("%d\t %.2f\t %.2f\t %.2f\n", i, lewis, stroll, diff);
    fprintf(csv,"%d,%.2f,%.2f,%.2f\n", i, lewis, stroll, diff);
  }
  return 0;
}