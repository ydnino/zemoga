# zemoga
The proposed solution is based on the MVVM architecture whose benefits are:
1 This allows a separation of responsibilities in teams that are lucky enough to have a designer and a programmer ... each can work independently of the other.
Logic of sight "without sense". The views are independent of the code that runs behind them, which allows the same view logic to be reused in multiple views or for a view to be easily reworked or replaced. Separate the concerns between "behavior" and "style".
There is no duplicate code to update the views.
With MVVM you can be sure that the view is updated properly by simply setting the underlying property and all the side effects of viewing it.
Testability Since its logic is completely independent of its point of view (without references of "myLabel.Text"), the unit test is easier. You can test the behavior of a ViewModel without involving your view. This also allowed the development based on tests of the behavior of the sight, which is almost impossible using the underlying code.

The other two patterns are really separate in terms of the concerns they address. You can use MVVM with MVP and MVC (most of the good samples out there do some form of this). In fact, MVP (with a passive view, instead of a supervisory controller) is really a variant of MVVM, In my opinion.

The architecture of the code is:
The form in which the information of each view is completed is stored in the Viewmodel folder
The structure of the data to be obtained in the application is stored in the Mode folder]
In the View folder the way in which the application content is displayed is stored
The sevicios folder is stored the way I get the application information through the services, api rest json

The application performs the following:
Load the posts​ from the JSON API and populate the sidebar.
The first 20 posts should have a blue dot indicator.
Once a post is touched, its related content is shown in the main content area.
Each cell should have the functionality to swipe and delete the post.
Add a button to the footer that removes all posts
Add a button to navigation that reloads all posts.
Add animations when the user deletes each/all posts.

