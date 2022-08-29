-- CreateTable
CREATE TABLE "Friend" (
    "friend_id" INTEGER NOT NULL,
    "following_id" INTEGER NOT NULL,

    CONSTRAINT "Friend_pkey" PRIMARY KEY ("friend_id","following_id")
);

-- AddForeignKey
ALTER TABLE "Friend" ADD CONSTRAINT "Friend_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Friend" ADD CONSTRAINT "Friend_following_id_fkey" FOREIGN KEY ("following_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
