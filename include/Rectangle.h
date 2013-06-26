#ifndef __JERRY_Rectangle__
#define __JERRY_Rectangle__

#include <Shape.h>

namespace JERRY_SOOCHOW
{

class Rectangle: public Shape
{
	public:
		void draw(void);
		void erase(void);
};

}

#endif
