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
*/
Freesound.getAuthorizationPage;
//:
/*
	Copy the output from this and enter it into a browser.
On the page of the browser, click the button to give authorization.
Copy the string that is returned on the webpage from the above action.
Then input this string to the following command:
*/
Freesound.getToken("LWk9RsEda1ZM9lTNpzKqEFw4qYtTe8");
//:
/*
At this stage, Freesound obtains a token and stores it.
This token will remain valid for about 1 day.
After this interval one can refresh the token by running:
*/

Freesound.refreshToken;

//: Get the properties of a file stored in Freesound.org
// Note: This does not download the audio file itself,
// it only gets the metadata.
// But you need the FSSound instance created here, in order
// to download the actual sound file from it. See below.
FSSound.getSound(31362, { | f |
	~snd = f
});
//:
~snd.inspect;
//: Download an audio file stored in Freesound.org
~snd.retrieve((PathName(Platform.userHomeDir)  +/+ "audiofiles" +/+ "").fullPath);
// NOTE: The directory where you want to store the file must already exist.
//:
