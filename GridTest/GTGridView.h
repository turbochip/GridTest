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
@property (nonatomic,strong) NSMutableArray * cell;
@property (nonatomic) BOOL redraw;
@end
