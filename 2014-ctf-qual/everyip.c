#include <stdio.h>

int main()
{
	char buf[BUFSIZ];
	char *p1, *p2, *p3, *p4;
	int o1, o2, o3, o4;

	for (o1 = 0; o1 < 256; o1++) {
		p1 = buf + sprintf(buf, "%d.", o1);
		fprintf(stderr, "%s\n", buf);  // status update
		for (o2 = 0; o2 < 256; o2++) {
			p2 = p1 + sprintf(p1, "%d.", o2);
			for (o3 = 0; o3 < 256; o3++) {
				p3 = p2 + sprintf(p2, "%d.", o3);
				for (o4 = 0; o4 < 256; o4++) {
					p4 = p3 + sprintf(p3, "%d\n", o4);
					fwrite(buf, 1, p4 - buf, stdout);
				}
			}
		}
	}
}
