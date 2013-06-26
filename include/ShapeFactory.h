#ifndef __JERRY_ShapeFactory__
#define __JERRY_ShapeFactory__

#include <Kind.h>
#include <Shape.h>

namespace JERRY_SOOCHOW
{

class ShapeFactory: public Kind
{
	public:
		static Shape* createShape(Kind::ShapeKind);
};

}

#endif
