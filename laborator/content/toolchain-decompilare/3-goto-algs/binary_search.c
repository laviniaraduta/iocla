#include <stdio.h>

int main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = 66; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;

	/* TODO: Implement binary search */
	// (void) dest;
	// (void) start;
	// (void) end;
	int mid;
loop:
	mid = (start + end) / 2;
	if (start > end) {
		printf("Not found\n");
		goto end;
	}

	if (v[mid] == dest) {
		printf("Found %d at index %d\n", dest, mid);
		goto end;
	}
	if (v[mid] < dest) {
		goto right_part;
	}
	if (v[mid] > dest) {
		goto left_part;
	}

right_part:
	start = mid + 1;
	goto loop;

left_part:
	end = mid - 1;
	goto loop;

end:
	return 0;
}
