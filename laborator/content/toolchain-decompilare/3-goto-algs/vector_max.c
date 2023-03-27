#include <stdio.h>

int main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max;
	int i;

	/* TODO: Implement finding the maximum value in the vector */
	max = v[0];
	i = 1;

loop:
	if (i >= (int) sizeof(v) / (int) sizeof(int)) {
		goto end;
	}
	if (v[i] > max) {
		max = v[i];
	}
	i++;
	goto loop;

end:
	printf("Max: %d\n", max);
}
