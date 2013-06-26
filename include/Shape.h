#ifndef __JERRY_SHAPE__
#define __JERRY_SHAPE__

#include <Kind.h>

namespace JERRY_SOOCHOW
{
class Shape
{
	public:
		virtual void draw(void) = 0;
		virtual void erase(void) = 0;
};

}
#endif
