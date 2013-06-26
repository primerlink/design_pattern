#include <iostream>
#include <ShapeFactory.h>
#include <Shape.h>
#include <Circle.h>
#include <Rectangle.h>
#include <Triangle.h>

namespace JERRY_SOOCHOW
{

Shape*  ShapeFactory::createShape(Kind::ShapeKind kind)
{
	switch( kind )
	{
		case Kind::CIRCLE:
			return new Circle();
		case Kind::RECTANGLE:
			return new Rectangle();
		case Kind::TRIANGLE:
			return new Triangle();
	}
}

}
