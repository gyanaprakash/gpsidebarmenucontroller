It is a mobile app which will tell you brief concept about block with a brief look about side bar menu library. Here I present the total design part with the great looks.

Just drag and drop these two files into your project of implementation file(viewcontroller.h and viewController.m) as well as into your nib file.

It will make you very easier to learn block concept and UI part of slider menu.

It looks so reliable and robust.
its the process to animate the view
[UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionTransitionFlipFromLeft
                         animations:^
         {
             CGRect frame = self.view.frame;
             frame.origin.y = 0;
             frame.origin.x = (250);
             self.menueView.layer.shadowOpacity = 0.8;
             self.menueView.layer.shadowRadius = 25;
             self.menueView.layer.shadowOffset = CGSizeMake(5, 5);
             self.menueView.frame = frame;
             self.mainView.frame=self.view.frame;
             
         }
                         completion:^(BOOL finished)
         {
             isclick = 1;
             self.gestureRecognizer.enabled=YES;
             [self.gestureRecognizer addTarget:self action:@selector(gestureTap)];
             [self.menueView addGestureRecognizer:self.gestureRecognizer];
             NSLog(@"Completed");
         }];
    }
    else if (isclick == 1)
    {
        self.gestureRecognizer.enabled=NO;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionTransitionFlipFromRight
                     animations:^
     {
         CGRect frame = self.view.frame;
         frame.origin.y = 0;
         frame.origin.x = (-250);
         self.mainView.frame=frame;
         
         CGRect frame1 = self.view.frame;
         frame1.origin.y = 0;
         frame1.origin.x = 0;
        self.menueView.frame = frame1;
     }
                     completion:^(BOOL finished)
     {
         isclick = 0;

         NSLog(@"Completed");
         [self.menueView removeGestureRecognizer:self.gestureRecognizer];
         [self.menueView reloadInputViews];

     }];
    }
