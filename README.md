# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **David Zhu**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- [X] Allows customization of the three tip percentages.
- [X] Remembers the custom tip percentages entered across app restarts (if <10mins)
- [X] Utilizes stepper tool to track the number of people in your party.
- [X] Calculates the amount each person has to pay equally to split the total bill (bill amount + tip)

## Video Walkthrough

Here's a walkthrough of implemented user stories (basic version):

https://imgur.com/a/ohazxj1

Here is an updated walkthrough involving the ability to change the tip percentages:

https://imgur.com/a/02GdyLl

Here is an updated walkthrough involving the ability to remember the previously entered bill amount:

https://imgur.com/a/MEmdG7h

Here is an updated walkthrough involving the ability to remember the previously changed tip percentages and to customize the party size:

https://imgur.com/a/cmgdWDG

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

While building the app, I had difficulty implementing userDefaults. In addition, it took me quite a while to understand that "didEnterBackground" and similar functions are not functions that we would ever explicitly call, but rather functions that would fire whenever the appropriate action is triggered. This is the first time that I've ever coded in Swift, so I had to self-teach everything here in this project.

## License

    Copyright [2003] [David Zhu]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
