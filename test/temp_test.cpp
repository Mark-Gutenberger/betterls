#include <gtest/gtest.h>
#include <betterls/betterls.hpp>

TEST(DummyTest, CheckValues) {
	ASSERT_EQ(betterls::add(1, 2), 3);
	EXPECT_TRUE(true);
};

int main(int argc, char** argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
};
