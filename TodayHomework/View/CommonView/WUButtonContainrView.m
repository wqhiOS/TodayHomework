//
//  WUButtonContainrView.m
//  TodayHomework
//
//  Created by wuqh on 15/11/27.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "WUButtonContainrView.h"

@interface WUButtonContainrView()


@property (nonatomic, assign) NSInteger rowCount;
@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation WUButtonContainrView

- (void)awakeFromNib {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}



- (void)setUpWithTitles:(NSArray *)titles type:(WUButtonType)type width:(CGFloat)width finished:(void (^)(CGFloat))finish{
    
    if (width!=0) {
        self.width =width;
    }
    
//如果是再次赋值，应该删去之前创建的button，以及将self.buttons设置为空
    [self.buttons removeAllObjects];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

//之后根据传过来的标题数组初始化buttons
    for (int i = 0; i<titles.count; i++) {
        WUButton *button = [[WUButton alloc] initWithType:type title:titles[i]];
        
        if (i == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
        
        [self.buttons addObject:button];
    }
    
//计算排列buttons 需要 多少行 多少列
    //获得button的高度和宽度
    CGFloat buttonWidth = [self.buttons.firstObject width];
    CGFloat buttonHeight = [self.buttons.firstObject height];
    
    self.columnCount = self.width/(buttonWidth + self.columnSpacing);
    NSLog(@"%f %f",self.width,buttonWidth);
  
    if (self.buttons.count <self.columnCount) {
        self.rowCount = 1;
        self.columnCount = self.buttons.count;
    }else {
        self.rowCount = self.buttons.count/self.columnCount;
        self.rowCount += self.buttons.count%self.columnCount==0?0:1;
        NSLog(@"%ld %d",self.buttons.count/self.columnCount,self.buttons.count%self.columnCount==0?0:1);
    }
   
//排列button
    NSInteger index = 0;
    for (NSInteger i = 0; i < self.rowCount; i++) {
        for (NSInteger j = 0; j < self.columnCount; j++) {
            if (index == self.buttons.count) {
                break;
            }
            WUButton *button = self.buttons[index];
            button.x = (buttonWidth+self.columnSpacing)*j;
            button.y = (buttonHeight+self.rowSpacing)*i;
            
            [self addSubview:button];
            index++;
        }
    }
//更新容器的高度（容器的宽度是外界固定的，容器的高度是根据button数量决定的）
    if (finish) {
        finish((buttonHeight + self.rowSpacing)*self.rowCount);
    }    
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = @[].mutableCopy;
    }
    return _buttons;
}

- (CGFloat)rowSpacing {
    return 20;
}

- (CGFloat)columnSpacing {
    return 8;
}

@end
