//
//  ClassManageSelectSubjectView.m
//  TodayHomework
//
//  Created by wuqh on 15/12/11.
//  Copyright © 2015年 吴启晗. All rights reserved.
//

#import "ClassManageSelectSubjectView.h"
#import "WUButton.h"

@interface ClassManageSelectSubjectView()

@property (nonatomic, strong) NSMutableArray *buttons;


@end

@implementation ClassManageSelectSubjectView

static CGFloat buttonWidth;
static CGFloat widthSpacing;

- (void)setSubjects:(NSArray *)subjects {
    
    _subjects = subjects;
    for (NSString *subject in self.subjectsDict.allKeys) {
        WUButton *button  =[[WUButton alloc] initWithType:WUButtonTypeMultiple title:subject];
        buttonWidth = button.width;
        button.centerY = self.height/2;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self addSubview:button];
    }
    [self setNeedsDisplay];
    
}

- (void)setTeacherSubjects:(NSDictionary *)teacherSubjects selectedSubjects:(NSArray *)selectedSubjects {
    _subjects = selectedSubjects;
    _teacherSubjects = teacherSubjects;
    for (NSString *subject in teacherSubjects.allKeys) {
        WUButton *button  =[[WUButton alloc] initWithType:WUButtonTypeMultiple title:subject];
        buttonWidth = button.width;
        button.centerY = self.height/2;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self addSubview:button];
    }
    
    for (WUButton *button in self.buttons) {
        for (NSString *subject in self.subjectsDict.allKeys) {
            if ([button.currentTitle isEqualToString:subject]) {
                button.selected = YES;
            }
        }
    }
    [self setNeedsDisplay];
}

- (void)btnClick:(WUButton *)button {
    button.selected = !button.selected;
}


- (void)layoutSubviews {
    
    widthSpacing = (self.width-buttonWidth*_teacherSubjects.count)/(_teacherSubjects.count+1);

    for (int i = 0; i < self.buttons.count; i++) {
        self.subviews[i].x = widthSpacing+(widthSpacing+buttonWidth)*i;
    }
}

#pragma mark public method
- (NSString *)selectedSubjectsId {
   
    NSMutableArray *selectSubjects = @[].mutableCopy;
    for (WUButton *button in self.buttons) {
        if (button.selected) {
            [selectSubjects addObject:[self.teacherSubjects objectForKey:button.currentTitle]];
        }
    }
    return [selectSubjects componentsJoinedByString:@","];
    
};

#pragma mark  -getter
- (NSMutableArray *)buttons {
    if (!_buttons) {
        
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSMutableDictionary *)subjectsDict {
    if (!_subjectsDict) {
        
        NSMutableArray *keys = @[].mutableCopy;
        NSMutableArray *objects = @[].mutableCopy;
        for (NSString *subject in self.subjects) {
            NSRange range = [subject rangeOfString:@"-"];
            [keys addObject:[subject substringFromIndex:range.location+1]];
            [objects addObject:[subject substringToIndex:range.location]];
        }
        _subjectsDict = [[NSMutableDictionary alloc] initWithObjects:objects forKeys:keys];
        
    }
    return _subjectsDict;
}

@end
