/*
 * Description: This C program takes the following two arguments from the command line:
 * 		(a) writeFile - Full path to a an existing file
 * 		(b) writeStr - Text string which will be written in the above specified file
 *
 * Author: Kishore Anand
 */

#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
	openlog(NULL, 0, LOG_USER);

	if (argc != 3)
	{
		syslog(LOG_ERR, "Invalid number of arguments!");
		closelog();
		return 1;
	}

	const char *writeFile = argv[1];
	const char *writeStr = argv[2];

	FILE *file = fopen(writeFile, "w");

	if (file == NULL)
	{
		syslog(LOG_ERR, "%s: No such file exists!", writeFile);
		closelog();
		return 1;
	}

	syslog(LOG_DEBUG, "Writing %s to %s...", writeStr, writeFile);
	fputs(writeStr, file);

	fclose(file);
	closelog();

	return 0;
}


