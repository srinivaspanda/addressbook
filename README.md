# Address Book Application

# Points to note :
    > I have used Null Safety in this application so requesting you to update your Dart version to > 2.12 or later and then run this app.
    > Used BLoC architecture to complete this assignment since this is more maintainable and scalable solution.
    > Segregated all components in their own folder
    > Have comments in most of the places but might have missed in few places too.
    
# Application features:     
    > Data is fetched locally form a list as provided along with this assignment.
    > Used slivers and customscrollview to display the contact names.
    > Contact Names are grouped with first character of the name and is displayed in sliver header.
    > Added header and footer widget to GroupView widget which can be configured easily.
    > Search feature is embeded in the header of GroupView
    > On tapping the name it navigates to Detail view and come back.
    > All events and states are populated through BLoC pattern.
    > Also used following plugins to complete this assignment:
        anim_search_bar: ^2.0.2
        flutter_bloc: ^7.0.1
        equatable: ^2.0.3

# Why a “scroll to index” behaviour is not straightforward?
ListView or any scroll widget has no built-in support of scroll to index. 
If we want to achive this, then we need to know item size in List to navigate to index or jump to which is not that straight forward. 

 
