//
//  GTGridView.h
//  GridTest
//
//  Created by Chip Cox on 5/19/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grid.h"

@interface GTGridView : UIView
@property (nonatomic) BOOL redraw;
@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger col;
@end
