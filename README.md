# JSONPlaceholderapp

App to manage network requests and show their data on the screen


# About the project.

I have used The Clean Swift arquitecture using the templates of Raymond Law. If you want to know more about it, you can have a look in its website (ref: https://clean-swift.com/).

Regarding the pattern, it is a VIP one. However, The Clean Swift arquitecture has more components than an usual VIP pattern. That is to say, it gets the basic components (ViewControllers, Interactors, and Presenters) and, although Data Models, Routers and Workers. Basically the ViewController sends the events of user on the screen to the Interactor. The last one makes use of Workers in order to do the hardest tasks (network request, databases in/out). When the Worker has finished, it calls to the Interactor and then, the Interactor calls to Presenter, which formats all data to send all the information to the Viewcontroller.

Also. I have used the Repository Pattern, which let business logic to access the data object without having knowledge of data access architecture. Both patterns (Clean Swift and Tepository Pattern) are good to apply the S.O.L.I.D principles, which allow a better maintenance, understanding and flexibility to fix the bugs in the project.

Definitely, the reason why I have decided to do the project in this way is that I usually work with templates because, from my point of view, it is easier, faster, more comfortable and the team can work in the same background without big differences between the code.


## Installation

To install the app in simulator, firstly you need to execute the next command in the terminal when you are in the root directory where the pod file is located.

 	pod install

## Usage

First of all the app downloads the posts and users to show the main content, which are divided in two tabs: "Feed" and "Explore"

The first one (Feed) shows the latest posts that the users have posted. Besides, in there, the comments of an specific post are shown clicking on "See comments".

In Explore, when you click on an specific user, you navigate to the Details of Profile. This Scene is splited in "Albums" and "ToDos".

- Albums: It shows all albums of an user. Clicking on some album, You can see all photos that are related with it.
- ToDos: It shows all list of ToDos about an user. Also you can check what tasks have been completed.


## Improvements

### Networking:

We can improve the networking layer adding Alamofire framework. This framework is quite powerfull because it allows the HTTP response validation, network reachability, security...

About the security, it could be improved by adding a login, which returns us a session token while the app is alive. Also, we could send a customized user-agent, which has a bundleIdentifier with a encripted format, for example MD5, to do more difficult that someone spies us the requests.


### Configuration.

- Multiple targets  (Production, Integration, Development, QA). It is compulsory to support multiple targets, different build versions and the same code to perform the team work.

- i18n. I have created a simple localizable.strings file with all the project text. This fact makes easier to translate the application in every language that we want.
    

### Unit test.

In order to cover the protocol methods, I have made a simple layer of unit test trying. 

One way to improve it could be adding some code coverage to the existent code with more tests for the same methods taking care of the difference use cases, adding quality by performing more asserting inside every unit test. 
    
### UI/UX

In order to achieve a better look and feel, it could include:

- Skeleton to show data downloading instead of Spinning loader

- Improve cell views with text colors, font sizes, round in buttons

- A switch button to get two states in one instead two buttons, for example in the Profile Scene
    
- Install a logger for network requests to format the response.
