/*  4 Feb 2022 14:15
Setting up Freesound from scratch, to download files and load them
to buffer.



*/

Freesound.clientId = "6SdOTCLpQFojhPNkrjD6";
Freesound.clientSecret = "Jf1koezgVSapXI78ch3mxFQDe0XO5OcR10BWbHCT";

//:if you already / still have a token that is valid:
Freesound.refreshToken;
//:else to create token:
/*
Run this:

Freesound.getAuthorizationPage;

	Copy the output from this and enter it into a browser.
On the page of the browser, click the button to give authorization.
Copy the string that is returned on the webpage from the above action.
Then input this string to the following command:

Freesound.getToken(<authorization string from website here>);

At this stage, Freesound obtains a token and stores it.
This token will remain valid for about 1 day.
After this interval one can refresh the token by running:

Freesound.refreshToken;

*/