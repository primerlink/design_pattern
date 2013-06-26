#include <iostream>
#include <Kind.h>
#include <ShapeFactory.h>
#include <Shape.h>

using namespace JERRY_SOOCHOW;
//using JERRY_SOOCHOW::Kind::ShapeKind;
int main(void)
{
	Shape *shape = NULL;


	shape = ShapeFactory::createShape(Kind::CIRCLE);
	shape->draw();
	shape->erase();
	delete shape;

	shape = ShapeFactory::createShape(Kind::TRIANGLE);
	shape->draw();
	shape->erase();
	delete shape;

	shape = ShapeFactory::createShape(Kind::RECTANGLE);
	shape->draw();
	shape->erase();
	delete shape;


	return 0;
}
