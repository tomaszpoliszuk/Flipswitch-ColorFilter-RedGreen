#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ColorFilterRedGreenSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSRedGreenFilterEnabled();
extern "C" void _AXSRedGreenFilterSetEnabled(BOOL);

@implementation ColorFilterRedGreenSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSRedGreenFilterEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSRedGreenFilterSetEnabled(newState == FSSwitchStateOn);
}

@end
