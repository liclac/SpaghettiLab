//
//  SLTypes.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#ifndef SpaghettiLab_SLTypes_h
#define SpaghettiLab_SLTypes_h

/**
 * 2D Vector Type
 */

class SLVector {
public:
	float x, y;
	
	SLVector(float x = 0, float y = 0):
		x(x), y(y)
	{
		
	}
	
	SLVector& operator+=(const SLVector& rhs)
	{
		x += rhs.x;
		y += rhs.y;
		return *this;
	}
	SLVector& operator-=(const SLVector& rhs)
	{
		x -= rhs.x;
		y -= rhs.y;
		return *this;
	}
	SLVector& operator*=(const SLVector& rhs)
	{
		x *= rhs.x;
		y *= rhs.y;
		return *this;
	}
	
	SLVector& operator+=(const float& rhs)
	{
		x += rhs;
		y += rhs;
		return *this;
	}
	SLVector& operator-=(const float& rhs)
	{
		x -= rhs;
		y -= rhs;
		return *this;
	}
	SLVector& operator*=(const float rhs)
	{
		x *= rhs;
		y *= rhs;
		return *this;
	}
};

inline SLVector operator+(SLVector lhs, const SLVector& rhs)
{
	lhs += rhs;
	return lhs;
}
inline SLVector operator-(SLVector lhs, const SLVector& rhs)
{
	lhs -= rhs;
	return lhs;
}
inline SLVector operator*(SLVector lhs, const SLVector& rhs)
{
	lhs *= rhs;
	return lhs;
}

inline SLVector operator+(SLVector lhs, const float& rhs)
{
	lhs += rhs;
	return lhs;
}
inline SLVector operator-(SLVector lhs, const float& rhs)
{
	lhs -= rhs;
	return lhs;
}
inline SLVector operator*(SLVector lhs, const float& rhs)
{
	lhs *= rhs;
	return lhs;
}



inline float dot(SLVector a, SLVector b)
{
	return (a.x * b.x) + (a.y + b.y);
}

#endif
